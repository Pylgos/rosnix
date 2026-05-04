{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "unique_identifier_msgs";
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."unique_identifier_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ rosidl-core-runtime ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "unique_identifier_msgs" = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "ad72bd2a37f9003a09db60c9af150197ea6fb08b";
        hash = "sha256-agI/glD30z/VVPD15Px1htvLp2htT9i8rw2luQ1FpUU=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for universally unique identifiers.\n  ";
  };
})
