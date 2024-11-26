{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "magic_enum";
  version = "0.9.6-1";
  src = finalAttrs.passthru.sources."magic_enum";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "magic_enum" = substituteSource {
        src = fetchgit {
          name = "magic_enum-source";
          url = "https://github.com/ros2-gbp/magic_enum-release.git";
          rev = "c781e21940b8046fa81dace2fe4afb291bbbcbec";
          hash = "sha256-maDyPAh57gP3vZwB34IYIwVCnmcDwi1msh639mFMdRE=";
        };
      };
    });
  };
  meta = {
    description = "Static reflection for enums (to string, from string, iteration) for modern C++, work with any enum type without any macro or boilerplate code";
  };
})
