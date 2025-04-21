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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."teleop_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_tools" = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "1674cff4b740837a1dcad7681cf742ed77749962";
        hash = "sha256-O1fu/PGJZzFLVfLuU6wBQB37QJypyJj308TNlgeNiD4=";
      };
    };
  });
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
})
