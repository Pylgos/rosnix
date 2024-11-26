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
  version = "2.7.0-1";
  src = finalAttrs.passthru.sources."unique_identifier_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "unique_identifier_msgs" = substituteSource {
        src = fetchgit {
          name = "unique_identifier_msgs-source";
          url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
          rev = "7961de6e73e2d05d8bb1f9bec4baabb2116ece4c";
          hash = "sha256-RsXOsXOLhILnsdIJIseSj4+KuBj9hrISfm/4CH0Obms=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for universally unique identifiers.";
  };
})
