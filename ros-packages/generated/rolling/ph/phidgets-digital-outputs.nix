{
  ament-cmake-ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  phidgets-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "phidgets_digital_outputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "19a417adb7755b9c791486703491c84a77a2e5af";
        hash = "sha256-KupijHg2trBRdHREmgsrAmrCxE0f+hnvA6BJOjIZ1Yc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "phidgets_digital_outputs";
  version = "2.3.3-1";
  src = sources."phidgets_digital_outputs";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Digital Output devices";
  };
}
