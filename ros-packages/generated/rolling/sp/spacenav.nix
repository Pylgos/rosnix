{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "spacenav";
  version = "3.3.0-2";
  src = finalAttrs.passthru.sources."spacenav";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libspnav-dev" "spacenavd" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spacenav" = substituteSource {
      src = fetchgit {
        name = "spacenav-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "d5e13eaca0ffde926e41a100f3a23638fece1334";
        hash = "sha256-5WXkdmHcAdaPaMSMNcTfScbDq9VNmFSb7jofUAAHyAk=";
      };
    };
  });
  meta = {
    description = "ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick.";
  };
})
