{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raph-description,
  raph-interfaces,
  raph-teleop,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."raph";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ raph-description raph-interfaces raph-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raph-description raph-interfaces raph-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "raph" = substituteSource {
      src = fetchgit {
        name = "raph-source";
        url = "https://github.com/ros2-gbp/raph_common-release.git";
        rev = "a512e391086d63d77d15628db30518d3e4623e70";
        hash = "sha256-RgdAIw0H+P/ra5SLGxdHWiUorIem7BjYN5YeXkU7KS8=";
      };
    };
  });
  meta = {
    description = "\n    Packages for Raph Rover common to the robot and desktop\n  ";
  };
})
