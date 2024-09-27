{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_console_util-dced1d7c008826152d81a1f367ecc3e0d5439e22 = substituteSource {
      src = fetchgit {
        name = "swri_console_util-dced1d7c008826152d81a1f367ecc3e0d5439e22-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "dced1d7c008826152d81a1f367ecc3e0d5439e22";
        hash = "sha256-kzSZInTsgWLY1tBOwqmsKcv6dwgmwwBvI5E5C+WzLDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_console_util";
  version = "3.7.3-1";
  src = sources.swri_console_util-dced1d7c008826152d81a1f367ecc3e0d5439e22;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utility functions for interacting with console";
  };
}
