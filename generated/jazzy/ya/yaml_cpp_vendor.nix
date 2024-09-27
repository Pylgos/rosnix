{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    yaml-cpp-vendor_source-f7320141120f720aecc4c32be25586e7da9eb978 = substituteSource {
      src = fetchgit {
        name = "yaml-cpp-vendor_source-f7320141120f720aecc4c32be25586e7da9eb978-source";
        url = "https://github.com/jbeder/yaml-cpp.git";
        rev = "f7320141120f720aecc4c32be25586e7da9eb978";
        hash = "sha256-J87oS6Az1/vNdyXu3L7KmUGWzU0IAkGrGMUUha+xDXI=";
      };
      substitutions = [
      ];
    };
    yaml_cpp_vendor-01001306eb4361d5de3bb06a749a72769884cadd = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-01001306eb4361d5de3bb06a749a72769884cadd-source";
        url = "https://github.com/ros2-gbp/yaml_cpp_vendor-release.git";
        rev = "01001306eb4361d5de3bb06a749a72769884cadd";
        hash = "sha256-+IC1J62UuHdmOjU/1+W0xO33jgHhgeC3OZXA8E8ewDw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/jbeder/yaml-cpp.git";
          to = "VCS_TYPE path VCS_URL ${yaml-cpp-vendor_source-f7320141120f720aecc4c32be25586e7da9eb978}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "yaml_cpp_vendor";
  version = "9.0.0-2";
  src = sources.yaml_cpp_vendor-01001306eb4361d5de3bb06a749a72769884cadd;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it.";
  };
}
