{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav_2d_msgs-539d291a79814f3b5881c5776d7d13a46be85e99 = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-539d291a79814f3b5881c5776d7d13a46be85e99-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "539d291a79814f3b5881c5776d7d13a46be85e99";
        hash = "sha256-Fb29xt0/Ou72DqfWrojC+Avcrl6GR8FYzKkQmswHiu8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_msgs";
  version = "1.3.2-1";
  src = sources.nav_2d_msgs-539d291a79814f3b5881c5776d7d13a46be85e99;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.";
  };
}
