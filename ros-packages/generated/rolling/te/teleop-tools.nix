{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-teleop,
  key-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-tools-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "teleop_tools";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."teleop_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_tools" = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "743e6770fa06bc0148125ee4b0cc99c582e0c1c6";
        hash = "sha256-+JE2IDErv6bUSUBjfAW2y+maxrMFHvHuyK/zpUhH9CE=";
      };
    };
  });
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
})
