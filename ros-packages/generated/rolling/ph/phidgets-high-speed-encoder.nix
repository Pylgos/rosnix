{
  ament-cmake-ros,
  buildAmentCmakePackage,
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
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "phidgets_high_speed_encoder" = substituteSource {
      src = fetchgit {
        name = "phidgets_high_speed_encoder-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "d15cb831059418291e61ba4877bbef999cc57107";
        hash = "sha256-+tQ+vw/pWTXBDexHIJi6YokVycAl8GdJSxKQ6Lxj39Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_high_speed_encoder";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_high_speed_encoder";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Driver for the Phidgets high speed encoder devices";
  };
})
