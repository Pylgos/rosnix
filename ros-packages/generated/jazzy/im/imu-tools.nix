{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-complementary-filter,
  imu-filter-madgwick,
  mkSourceSet,
  rosSystemPackages,
  rviz-imu-plugin,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "imu_tools" = substituteSource {
      src = fetchgit {
        name = "imu_tools-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "df19112520926bebd06030f598ac67b9e1c7b9fb";
        hash = "sha256-+i6Cvdit5GQDlcCdOUAFdg6ESROTgWjJQ1IqxGC94Ug=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "imu_tools";
  version = "2.1.3-4";
  src = sources."imu_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Various tools for IMU devices";
  };
}
