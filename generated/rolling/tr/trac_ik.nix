{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  trac_ik_kinematics_plugin,
  trac_ik_lib,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    trac_ik-719a13ffcbf7ecb033165cdd112631c14f8d8b41 = substituteSource {
      src = fetchgit {
        name = "trac_ik-719a13ffcbf7ecb033165cdd112631c14f8d8b41-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "719a13ffcbf7ecb033165cdd112631c14f8d8b41";
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
  src = sources.trac_ik-719a13ffcbf7ecb033165cdd112631c14f8d8b41;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ trac_ik_kinematics_plugin trac_ik_lib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ROS packages in this repository were created to provide an improved alternative Inverse Kinematics solver to the popular inverse Jacobian methods in KDL. TRAC-IK handles joint-limited chains better than KDL without increasing solve time.";
  };
}
