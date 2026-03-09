{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbot_gazebo";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_gazebo";
  passthru.sources = mkSourceSet (sources: {
    "rosbot_gazebo" = substituteSource {
      src = fetchgit {
        name = "rosbot_gazebo-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "3512e71c0e5a1cb995f257b436d0af1702dbbaa6";
        hash = "sha256-5JNXobVxP33Rm0RtVAVdrlhzuXS22S0RIK6QKtmhmPI=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation for ROSbot Series";
  };
})
