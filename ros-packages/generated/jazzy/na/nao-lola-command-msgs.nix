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
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."nao_lola_command_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nao_lola_command_msgs" = substituteSource {
        src = fetchgit {
          name = "nao_lola_command_msgs-source";
          url = "https://github.com/ros2-gbp/nao_lola-release.git";
          rev = "bee52f8cf556d8d71ae7eaa5020654e986e6f8e0";
          hash = "sha256-IndgGzImBnJw0rE9ABJUpaTnide4Sgyo0iQGNQ2MAC0=";
        };
      };
    });
  };
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
})
