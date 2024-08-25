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
        rev = "27dad34acd8a7d7c4c06b4db8f8017ff818ad027";
        hash = "sha256-3Zx/r/5OMt+vLFOubBqvuKTRKYOiy29W4a+6cfigtVE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tutorials";
  version = "2.1.0-1";
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
