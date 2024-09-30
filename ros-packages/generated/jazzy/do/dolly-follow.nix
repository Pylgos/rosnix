{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dolly_follow" = substituteSource {
      src = fetchgit {
        name = "dolly_follow-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "47cbab8d3916e099b2487642be419d68f98efa7f";
        hash = "sha256-Udj2U+dWE5+JIz9GOSB6X4C9y3g/g30Jp3+BTuiiRX0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dolly_follow";
  version = "0.4.0-6";
  src = sources."dolly_follow";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Follow node for Dolly, the robot sheep.";
  };
}
