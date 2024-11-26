{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-description,
  leo-msgs,
  leo-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."leo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-description leo-msgs leo-teleop ];
  passthru = {
    sources = mkSourceSet (sources: {
      "leo" = substituteSource {
        src = fetchgit {
          name = "leo-source";
          url = "https://github.com/ros2-gbp/leo_common-release.git";
          rev = "09a961a7bc2398b8db54b8b79ba94336d10be164";
          hash = "sha256-H54G7g0Z1kE0VRP3SfM/v1rG2iz01Ybvx1nyLhkUitI=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage of software for Leo Rover common to the robot and ROS desktop";
  };
})
