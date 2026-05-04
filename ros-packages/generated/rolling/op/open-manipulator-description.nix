{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_description";
  version = "4.1.2-2";
  src = finalAttrs.passthru.sources."open_manipulator_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_description" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_description-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "125d64724ec5385f1536d1568347e1e16f1f6217";
        hash = "sha256-H7VBaPox7c92a5YDzw1bedGs/9/VsVE/EtlsIr+Q2H4=";
      };
    };
  });
  meta = {
    description = "\n    open_manipulator_description ROS 2 package.\n  ";
  };
})
