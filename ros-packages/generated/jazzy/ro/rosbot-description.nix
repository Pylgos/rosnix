{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  dynamixel-hardware-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  husarion-components-description,
  joint-state-publisher,
  launch,
  launch-ros,
  mkSourceSet,
  open-manipulator-description,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_description";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dynamixel-hardware-interface husarion-components-description joint-state-publisher launch launch-ros open-manipulator-description robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-hardware-interface husarion-components-description joint-state-publisher launch launch-ros open-manipulator-description robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_description" = substituteSource {
      src = fetchgit {
        name = "rosbot_description-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "831b40cfde8d3d0a18891e46aa9d0f11b1336130";
        hash = "sha256-qBnPxwMCNtneQQUoZuXrSMfzWxvykbr8Cxt2aQ35xo0=";
      };
    };
  });
  meta = {
    description = "The rosbot_description package";
  };
})
