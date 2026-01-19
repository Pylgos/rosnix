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
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "eventdispatch_ros2_interfaces";
  version = "0.2.26-1";
  src = finalAttrs.passthru.sources."eventdispatch_ros2_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "eventdispatch_ros2_interfaces" = substituteSource {
      src = fetchgit {
        name = "eventdispatch_ros2_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_eventdispatch-release.git";
        rev = "6f447f928ad95d2f7a766f870c38178824981c3d";
        hash = "sha256-2ihyfwuDFu721sH0tmEI/aSEOr5OnV5ZliBLoZDS04k=";
      };
    };
  });
  meta = {
    description = "ROSEvent srv / msg";
  };
})
