{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_worlds";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."leo_gz_worlds";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_worlds" = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "c5fd28ff3a0234f347c09554c75dda0c9353b784";
        hash = "sha256-BOEvYCqm3/XQ1z70/YEZxYghsOdug8xYEaT8I7KWPGY=";
      };
    };
  });
  meta = {
    description = "Gazebo worlds for Leo Rover simulation in ROS 2";
  };
})
