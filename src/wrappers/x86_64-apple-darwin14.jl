# Autogenerated wrapper script for Libiconv_jll for x86_64-apple-darwin14
export libcharset, libiconv

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libcharset`
const libcharset_splitpath = ["lib", "libcharset.1.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcharset_path = ""

# libcharset-specific global declaration
# This will be filled out by __init__()
libcharset_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcharset = "@rpath/libcharset.1.dylib"


# Relative path to `libiconv`
const libiconv_splitpath = ["lib", "libiconv.2.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libiconv_path = ""

# libiconv-specific global declaration
# This will be filled out by __init__()
libiconv_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libiconv = "@rpath/libiconv.2.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Libiconv")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libcharset_path = normpath(joinpath(artifact_dir, libcharset_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcharset_handle = dlopen(libcharset_path)
    push!(LIBPATH_list, dirname(libcharset_path))

    global libiconv_path = normpath(joinpath(artifact_dir, libiconv_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libiconv_handle = dlopen(libiconv_path)
    push!(LIBPATH_list, dirname(libiconv_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

