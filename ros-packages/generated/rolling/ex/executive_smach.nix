{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  smach,
  smach_msgs,
  smach_ros,
  substituteSource,
}:
let
  sources = rec {
    executive_smach-d89d702228daab0e0f1aff6dd3c57b70cb37a998 = substituteSource {
      src = fetchgit {
        name = "executive_smach-d89d702228daab0e0f1aff6dd3c57b70cb37a998-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "d89d702228daab0e0f1aff6dd3c57b70cb37a998";
        hash = "sha256-68w8XZNadjLJdkgr+OVVW8Stg9rqS5wqQgYUxlZtOo0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "executive_smach";
  version = "3.0.3-2";
  src = sources.executive_smach-d89d702228daab0e0f1aff6dd3c57b70cb37a998;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ smach smach_msgs smach_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This metapackage depends on the SMACH library and ROS SMACH integration packages.";
  };
}
