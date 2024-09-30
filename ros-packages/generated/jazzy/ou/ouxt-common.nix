{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ouxt-lint-common,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ouxt_common" = substituteSource {
      src = fetchgit {
        name = "ouxt_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "73ece7bb9cee3dc13c28efd24b80a0804f0a7f41";
        hash = "sha256-4nyGy7HVcpb5Cb/zBa9+kz8o7aXZyGqY2Fdy17Xd9ZY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ouxt_common";
  version = "0.0.8-5";
  src = sources."ouxt_common";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ouxt-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "common settings for OUXT Polaris ROS2 packages";
  };
}
