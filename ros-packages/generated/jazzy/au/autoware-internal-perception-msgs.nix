{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-perception-msgs,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "autoware_internal_perception_msgs";
  version = "1.5.0-2";
  src = finalAttrs.passthru.sources."autoware_internal_perception_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-perception-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_perception_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_perception_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "35a250f6b451c36214d7690f6d95d4038f43349c";
        hash = "sha256-UupwagoItxTKst52Vg6jb3FOQsvCGcOL5jAVcoMeWxw=";
      };
    };
  });
  meta = {
    description = "Autoware internal perception messages package.";
  };
})
