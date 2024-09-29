{
  ament-cmake-ros,
  buildRosPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rcl,
  rclc,
  rclc-lifecycle,
  rclc-parameter,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rclc_examples" = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "c337bef2b8518d838a103f525de33bab614c50ab";
        hash = "sha256-oGcnLCr8skjywWIh93EYKzbeJaXxJpnHiJB2rbxQjSI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclc-examples";
  version = "6.1.0-3";
  src = sources."rclc_examples";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rcl rclc rclc-lifecycle rclc-parameter std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example of using rclc_executor";
  };
}
