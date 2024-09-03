{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mvsim,
  substituteSource,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    mrpt_tutorials = substituteSource {
      src = fetchgit {
        name = "mrpt_tutorials-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "462a5da0510658cfb2ba0a0526652995aa50b4bd";
        hash = "sha256-Jbg3mfVV8tRkqyuSdv/FT3Us24gMojpWOQGWqkAIt5M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tutorials";
  version = "2.1.1-1";
  src = sources.mrpt_tutorials;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mvsim teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
}
