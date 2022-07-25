#include <stdio.h>

#define PY_SSIZE_T_CLEAN
#include <Python.h>

#define PY_FUNC_NAME        "add_numbers"
#define SCRIPT_FILE         "script.py"

typedef PyObject *pPyObject;

pPyObject py_load_file(pPyObject *dict, const char *name)
{
    FILE *fp = fopen(name, "r");
    pPyObject module, file;

    module = PyImport_AddModule("__main__");
    *dict = PyModule_GetDict(module);

    file = PyRun_File(fp, name, Py_file_input, *dict, *dict);

    fclose(fp);

    return file;
}

int py_add_numbers(pPyObject dict, int a, int b)
{
    int result;

    pPyObject function = PyDict_GetItemString(dict, "add_numbers");

    if (PyCallable_Check(function))
	{
		PyObject* _result = PyObject_CallFunction(function, "ii", a, b);
        result = PyLong_AsLong(_result);

        Py_XDECREF(_result);
        Py_XDECREF(function);
	}
    
    return result;
}

int main(void)
{
    int result;
    pPyObject dict, file;

    Py_Initialize();

    file = py_load_file(&dict, SCRIPT_FILE);
    result = py_add_numbers(dict, 20, 40);

    printf("Result: %d\n", result);

    Py_XDECREF(dict);
    Py_XDECREF(file);
    
    Py_Finalize();
    return 0;
}