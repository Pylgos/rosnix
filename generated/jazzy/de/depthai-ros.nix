{
  ament_cmake,
  buildRosPackage,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_examples,
  depthai_filters,
  depthai_ros_driver,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai-ros = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "3b33ccec2ebf621d2932374e799e6c5f08de0013";
        hash = "sha256-ux03CKLIoNv8q3t1KzqIHtCbVoIwB4BEmAlOJIXOGk8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai-ros";
  version = "2.10.1-1";
  src = sources.depthai-ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ depthai depthai_bridge depthai_descriptions depthai_examples depthai_filters depthai_ros_driver depthai_ros_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai-ros package";
  };
}
