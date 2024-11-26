{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_perception_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_perception_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "marti_perception_msgs" = substituteSource {
        src = fetchgit {
          name = "marti_perception_msgs-source";
          url = "https://github.com/ros2-gbp/marti_messages-release.git";
          rev = "d427ac464463e6d1c05701757a36af85c15f5d51";
          hash = "sha256-FZTo6sslxugGts/jf3daCxSI2sgmW4NAeYssvIrh1P8=";
        };
      };
    });
  };
  meta = {
    description = "marti_perception_msgs";
  };
})
