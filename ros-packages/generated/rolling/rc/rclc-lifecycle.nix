{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl-lifecycle,
  rclc,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rclc_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "20317ad1b89212bf608c06c988dbd1ee3039fc55";
        hash = "sha256-S6rPft/BC8XXLe0C9UCT8oPlYVqM0Vvvoj1MqVoApNQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "6.1.0-2";
  src = sources."rclc_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
}
