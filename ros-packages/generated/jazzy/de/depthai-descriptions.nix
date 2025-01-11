{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_descriptions";
  version = "2.10.5-1";
  src = finalAttrs.passthru.sources."depthai_descriptions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_descriptions" = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "1f19cfd29b8b42e5bf586ee37503b91be6b3a735";
        hash = "sha256-rRbUCYXAQsUXlLHS/SKk0cPcNH6bNVRelEhVzuhaZNs=";
      };
    };
  });
  meta = {
    description = "The depthai_descriptions package";
  };
})
