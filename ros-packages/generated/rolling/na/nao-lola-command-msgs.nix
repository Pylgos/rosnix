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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_lola_command_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."nao_lola_command_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_lola_command_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_lola_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "5b8562298bce0b0a607fa4df2833d91c3ef3ed61";
        hash = "sha256-IndgGzImBnJw0rE9ABJUpaTnide4Sgyo0iQGNQ2MAC0=";
      };
    };
  });
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
})
