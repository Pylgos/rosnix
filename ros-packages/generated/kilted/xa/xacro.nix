{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "xacro";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."xacro";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "xacro" = substituteSource {
      src = fetchgit {
        name = "xacro-source";
        url = "https://github.com/ros2-gbp/xacro-release.git";
        rev = "ed70dd567b79b9902f51762b418472e09cea545c";
        hash = "sha256-JSFyu4yW1TkEbeL1BSkhs8TQL+bkdX05ObQZuoPJANk=";
      };
    };
  });
  meta = {
    description = "Xacro (XML Macros)\n    Xacro is an XML macro language. With xacro, you can construct shorter and more readable XML files by using macros that expand to larger XML expressions.\n  ";
  };
})
