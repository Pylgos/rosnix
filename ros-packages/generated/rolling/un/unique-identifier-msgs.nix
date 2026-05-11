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
  version = "2.9.0-1";
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
        rev = "12c6ad8a66509adcf8c6005d5a3c7c0007984dd3";
        hash = "sha256-vukiQK6CEGbCycoCWJ5PKeDxTKm+0igW37hErG695lk=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for universally unique identifiers.\n  ";
  };
})
