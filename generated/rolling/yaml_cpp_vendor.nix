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
    yaml_cpp_vendor = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/yaml_cpp_vendor-release.git";
        rev = "9e9bcdb19d0f039cda3f7b85d7d1967375ed4e75";
        hash = "sha256-VByXPZaHa2QEnD87k1T/QHIi0RxntypmLhHxLzMLVps=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/jbeder/yaml-cpp.git";
          to = "VCS_TYPE path VCS_URL ${yaml_cpp_vendor-vendor_source-yaml-cpp-0}";
        }
      ];
    };
    yaml_cpp_vendor-vendor_source-yaml-cpp-0 = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-vendor_source-yaml-cpp-0-source";
        url = "https://github.com/jbeder/yaml-cpp.git";
        rev = "f7320141120f720aecc4c32be25586e7da9eb978";
        hash = "sha256-J87oS6Az1/vNdyXu3L7KmUGWzU0IAkGrGMUUha+xDXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "yaml_cpp_vendor";
  version = "9.1.0-1";
  src = sources.yaml_cpp_vendor;
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
