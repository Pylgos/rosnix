{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  trac_ik_kinematics_plugin,
  trac_ik_lib,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    trac_ik = substituteSource {
      src = fetchgit {
        name = "trac_ik-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "92b5f9f982498bed253e7fe0aaccabb177014abb";
        hash = "sha256-Mi5zU70nYLOrjdiVRLXtTefB9IBLrHv8HpqzxWWRWas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trac_ik";
  version = "2.0.1-1";
  src = sources.trac_ik;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ trac_ik_kinematics_plugin trac_ik_lib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS packages in this repository were created to provide an improved alternative Inverse Kinematics solver to the popular inverse Jacobian methods in KDL. TRAC-IK handles joint-limited chains better than KDL without increasing solve time.";
  };
}
