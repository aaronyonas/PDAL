@echo off

:: This configure script is designed for the default Windows world, which means
:: you have OSGeo4W installed, including Oracle and GDAL and LASzip.

:: This configure script expects to be run from the PDAL root directory.

:: Pick your CMake GENERATOR.  (NMake will pick up architecture (x32, x64) from your environment)
rem set GENERATOR="NMake Makefiles"
set GENERATOR="Visual Studio 10 Win64"
set GENERATOR="Visual Studio 10"

:: Pick your build type
set BUILD_TYPE=Release
set BUILD_TYPE=Debug

:: Where is your PDAL build tree?
set PDAL_DIR=.

:: Where is your OSGeo4W installed (recommended basic way to satisfy dependent libs)
set OSGEO4W_DIR=C:\OSGeo4W

:: Where is boost installed?
rem set BOOST_DIR=c:\utils\boost_1_48_0
set BOOST_DIR=%PDAL_DIR%\boost

:: GDAL
set GDAL_ENABLED=ON
set GDAL_INCLUDE_DIR=%OSGEO4W_DIR%\apps\gdal-dev\include
set GDAL_LIBRARY=%OSGEO4W_DIR%\apps\gdal-dev\lib\gdal_i.lib

:: LIBTIFF
set TIFF_ENABLED=ON
set TIFF_INCLUDE_DIR=%OSGEO4W_DIR%\include 
set TIFF_LIBRARY=%OSGEO4W_DIR%\lib\libtiff_i.lib 

:: GeoTIFF
set GEOTIFF_ENABLED=ON
set GEOTIFF_INCLUDE_DIR=%OSGEO4W_DIR%\include 
set GEOTIFF_LIBRARY=%OSGEO4W_DIR%\lib\geotiff_i.lib 

:: LASZIP
set LASZIP_ENABLED=ON
set LASZIP_INCLUDE_DIR=%OSGEO4W_DIR%\include
set LASZIP_LIBRARY=%OSGEO4W_DIR%\lib\laszip.lib

:: Oracle
set ORACLE_ENABLED=ON
set ORACLE_HOME=%OSGEO4W_DIR%
set ORACLE_INCLUDE_DIR=%ORACLE_HOME%\include
set ORACLE_LIBRARY=%ORACLE_HOME%\lib\oci.lib

:: LibXML2
set LIBXML2_ENABLED=ON
set LIBXML2_INCLUDE_DIR=%OSGEO4W_DIR%\include
set LIBXML2_LIBRARY=%OSGEO4W_DIR%\lib\libxml2.lib

:: IConv
set ICONV_ENABLED=ON
set ICONV_INCLUDE_DIR=%OSGEO4W_DIR%\include
set ICONV_LIBRARY=%OSGEO4W_DIR%\lib\iconv.lib

:: Set this if you are building SWIG bindings for C#. Visual Studio
:: needs to use this env var to find where boost lives.
set PDAL_SWIG_ENABLED=ON
set PDAL_SWIG_BOOST_HOME=%BOOST_DIR%

rem if EXIST CMakeCache.txt del CMakeCache.txt
cmake -G %GENERATOR% ^
    -DWITH_GDAL=%GDAL_ENABLED% ^
    -DWITH_GEOTIFF=%GEOTIFF_ENABLED% ^
    -DWITH_ORACLE=%ORACLE_ENABLED% ^
    -DWITH_LASZIP=%LASZIP_ENABLED% ^
    -DWITH_LIBXML2=%LIBXML2_ENABLED% ^
    -DWITH_SWIG_CSHARP=%PDAL_SWIG_ENABLED% ^
    -DWITH_ICONV=%ICONV_ENABLED% ^
    -DTIFF_INCLUDE_DIR=%TIFF_INCLUDE_DIR% ^
    -DTIFF_LIBRARY=%TIFF_LIBRARY% ^
    -DGEOTIFF_INCLUDE_DIR=%GEOTIFF_INCLUDE_DIR% ^
    -DGEOTIFF_LIBRARY=%GEOTIFF_LIBRARY% ^
    -DGDAL_INCLUDE_DIR=%GDAL_INCLUDE_DIR% ^
    -DGDAL_LIBRARY=%GDAL_LIBRARY% ^
    -DORACLE_INCLUDE_DIR=%ORACLE_INCLUDE_DIR% ^
    -DORACLE_OCI_LIBRARY=%ORACLE_LIBRARY% ^
    -DLASZIP_INCLUDE_DIR=%LASZIP_INCLUDE_DIR% ^
    -DLASZIP_LIBRARY=%LASZIP_LIBRARY% ^
    -DLIBXML2_LIBRARIES=%LIBXML2_LIBRARY% ^
    -DLIBXML2_INCLUDE_DIR=%LIBXML2_INCLUDE_DIR% ^
    -DICONV_LIBRARY=%ICONV_LIBRARY% ^
    -DICONV_INCLUDE_DIR=%ICONV_INCLUDE_DIR% ^
    -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
    -DCMAKE_VERBOSE_MAKEFILE=OFF ^
    %PDAL_DIR%


rem    -DWITH_PLANG=ON ^
rem    -DBOOST_INCLUDEDIR=%BOOST_DIR% ^
