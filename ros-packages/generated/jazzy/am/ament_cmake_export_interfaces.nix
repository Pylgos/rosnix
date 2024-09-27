{
  ament_cmake_core,
  ament_cmake_export_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_interfaces-701c75f89e3ec2cc9acf0b3a5273bba9a3c398e7 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-701c75f89e3ec2cc9acf0b3a5273bba9a3c398e7-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "701c75f89e3ec2cc9acf0b3a5273bba9a3c398e7";
        hash = "sha256-sDA4rGTnnDRsk4XYW/+Y8jSyj2g7TYH504sBEHlP8Gc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_interfaces";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_interfaces-701c75f89e3ec2cc9acf0b3a5273bba9a3c398e7;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
}
