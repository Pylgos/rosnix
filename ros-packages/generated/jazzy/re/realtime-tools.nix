{
  ament-cmake,
  ament-cmake-gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "91d15b9a3f699da477e644ad53208cbd93a9b8b1";
        hash = "sha256-mJ0j1sX7BpeTC7S7CmAoZXA0XLrOcy22ZW4+t0CWR4A=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "realtime_tools";
  version = "2.6.0-1";
  src = sources."realtime_tools";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
}
