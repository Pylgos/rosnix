{
  ament-cmake-auto,
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
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_msgs";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."hri_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hri_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_msgs-source";
        url = "https://github.com/ros4hri/hri_msgs-release.git";
        rev = "53db9ade0a933a061d4c57dedfd80b2215efad76";
        hash = "sha256-InEx7ZaBoVy56BDRNL8liF1jUoijwkKCn8y/HeIJFbk=";
      };
    };
  });
  meta = {
    description = "Messages, services and action definitions useful for Human-Robot Interaction";
  };
})
