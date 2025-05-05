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
  version = "9.2.0-1";
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
        rev = "597c3024f46437c883857c0f21fe002a26766bf4";
        hash = "sha256-MIwqEeb4wmx9K5t6jUI08K9hWdfQsymuKPzQMroZQEU=";
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
