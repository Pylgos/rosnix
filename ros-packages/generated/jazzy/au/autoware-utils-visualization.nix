{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_visualization";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_utils_visualization";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ visualization-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_visualization" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_visualization-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "8825e11af9d41c619fd8e8c5a7a30fb2bb2aa016";
        hash = "sha256-GRaEnfROwnVg0t4/otVvCX4Ng7GEbjXm/pQkjTZwvZo=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_visualization package";
  };
})
