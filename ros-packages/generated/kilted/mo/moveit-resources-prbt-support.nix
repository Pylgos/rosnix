{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_support";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2b26c84266c9cdccd6a53764cfa9244828705d0a";
        hash = "sha256-EPs2rOOkEuez/+mbAP9q21pyJF+uXBK5s4LFPJrPpPs=";
      };
    };
  });
  meta = {
    description = " Mechanical, kinematic and visual description\n  of the Pilz light weight arm PRBT. ";
  };
})
