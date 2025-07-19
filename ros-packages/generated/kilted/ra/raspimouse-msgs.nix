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
  pname = "raspimouse_msgs";
  version = "2.0.0-2";
  src = finalAttrs.passthru.sources."raspimouse_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_msgs" = substituteSource {
      src = fetchgit {
        name = "raspimouse_msgs-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "753778650a28ecbea20db6871799278bbc95f9fd";
        hash = "sha256-BTBw6W+S6YWOjkYwpnlUXY9tYU/1lQNPLM6WiiyHi8s=";
      };
    };
  });
  meta = {
    description = "RaspiMouse messages";
  };
})
