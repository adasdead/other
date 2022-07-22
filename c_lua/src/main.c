#include <stdio.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#define SCRIPT_LUA_PATH "script.lua"

int _cprint(lua_State *state);

void lua_addNumbers(lua_State *state, int a, int b);

int main(void)
{
    lua_State *state = luaL_newstate();
    luaL_dofile(state, SCRIPT_LUA_PATH);
    luaL_openlibs(state);

    lua_register(state, "cprint", _cprint);

    lua_addNumbers(state, 33, 44);
    
    lua_close(state);
    return 0;
}

void lua_addNumbers(lua_State *state, int a, int b)
{
    lua_getglobal(state, "addNumbers");
    lua_pushnumber(state, a);
    lua_pushnumber(state, b);

    lua_call(state, 2, 0);
}

int _cprint(lua_State *state)
{
    const char *str = lua_tostring(state, 1);
    printf("Called from C: %s\n", str);
    return 0;
}