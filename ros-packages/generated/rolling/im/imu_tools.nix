{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_complementary_filter,
  imu_filter_madgwick,
  rosSystemPackages,
  rviz_imu_plugin,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    imu_tools-55e6288579063c80959f603f849213c6baaffb71 = substituteSource {
      src = fetchgit {
        name = "imu_tools-55e6288579063c80959f603f849213c6baaffb71-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "55e6288579063c80959f603f849213c6baaffb71";
        hash = "sha256-sHoAl+cZacCjp1mSpqicVfhS+MZrLIE3WiUG4wmg6c8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_tools";
  version = "2.1.4-1";
  src = sources.imu_tools-55e6288579063c80959f603f849213c6baaffb71;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ imu_complementary_filter imu_filter_madgwick rviz_imu_plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Various tools for IMU devices";
  };
}
