{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-control-msgs,
  autoware-lint-common,
  autoware-localization-msgs,
  autoware-map-msgs,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-system-msgs,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rcl,
  rclcpp,
  rosSystemPackages,
  rosidl-runtime-cpp,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_component_interface_specs";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_component_interface_specs";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-system-msgs autoware-vehicle-msgs nav-msgs rcl rclcpp rosidl-runtime-cpp sensor-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-system-msgs autoware-vehicle-msgs nav-msgs rcl rclcpp rosidl-runtime-cpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_component_interface_specs" = substituteSource {
      src = fetchgit {
        name = "autoware_component_interface_specs-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9bea2ca98247c57aeb671dc4710d5235a883b0eb";
        hash = "sha256-rOQpV3EwkByJlPbmH/zSs/vz3JrtFRrkar28BfbqVxk=";
      };
    };
  });
  meta = {
    description = "The autoware_component_interface_specs package";
  };
})
