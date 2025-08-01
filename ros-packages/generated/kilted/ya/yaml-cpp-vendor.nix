{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yaml_cpp_vendor";
  version = "9.1.0-2";
  src = finalAttrs.passthru.sources."yaml_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yaml_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/yaml_cpp_vendor-release.git";
        rev = "d5e15ac9c728236ec04d92b00db2d55b9dc7b9e5";
        hash = "sha256-VByXPZaHa2QEnD87k1T/QHIi0RxntypmLhHxLzMLVps=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/jbeder/yaml-cpp.git";
          to = "VCS_TYPE path VCS_URL ${sources."yaml_cpp_vendor/yaml-cpp"}";
        }
      ];
    };
    "yaml_cpp_vendor/yaml-cpp" = substituteSource {
      src = fetchgit {
        name = "yaml-cpp-source";
        url = "https://github.com/jbeder/yaml-cpp.git";
        rev = "f7320141120f720aecc4c32be25586e7da9eb978";
        hash = "sha256-J87oS6Az1/vNdyXu3L7KmUGWzU0IAkGrGMUUha+xDXI=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
