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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."unique_identifier_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "unique_identifier_msgs" = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "cb99fa6df53855bd78d91e7c370de30c62506163";
        hash = "sha256-VQlqO5/77ix+k17gJj8d23jG5d5gWf3HUDPzE2FsxYc=";
      };
    };
  });
  meta = {
    description = "ROS messages for universally unique identifiers.";
  };
})
