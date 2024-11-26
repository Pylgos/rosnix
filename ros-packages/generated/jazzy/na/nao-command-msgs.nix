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
  pname = "nao_command_msgs";
  version = "1.0.0-3";
  src = finalAttrs.passthru.sources."nao_command_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_command_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "a36d9eed21ce44896146e9f47d6e14298c4c69a0";
        hash = "sha256-geYK5hMHI66LcCD6GJ3Lr8T0ocK3/ExFHKKq9kBUZRs=";
      };
    };
  });
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
})
