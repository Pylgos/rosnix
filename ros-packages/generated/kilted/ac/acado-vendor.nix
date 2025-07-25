{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
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
  pname = "acado_vendor";
  version = "1.0.0-7";
  src = finalAttrs.passthru.sources."acado_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "acado_vendor" = substituteSource {
      src = fetchgit {
        name = "acado_vendor-source";
        url = "https://github.com/ros2-gbp/acado_vendor-release.git";
        rev = "12a054df1bcdb0555d82c1c109b51207e1896618";
        hash = "sha256-8gA7ZwANcFmzyoc3egAGyB3xpAQlHrs4nK6U1/KanwA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/cho3/acado.git";
          to = "URL ${sources."acado_vendor/acado"}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/cho3/hpmpc.git";
          to = "URL ${sources."acado_vendor/hpmpc"}";
        }
      ];
    };
    "acado_vendor/acado" = substituteSource {
      src = fetchgit {
        name = "acado-source";
        url = "https://github.com/cho3/acado.git";
        rev = "8366e22cd5d815078e8d24f78dbced28b48d7e32";
        hash = "sha256-ExF4tV7ZpaL6BEwENt3CU+g2I1c2MOt0cs/Q9g/SSlI=";
      };
    };
    "acado_vendor/hpmpc" = substituteSource {
      src = fetchgit {
        name = "hpmpc-source";
        url = "https://github.com/cho3/hpmpc.git";
        rev = "abbcf0806e4c8763ab2129a90efd827d194c1b00";
        hash = "sha256-KGC2+9ce1lyaxrPR5gApoB7Msk3bgTnKJYvBxDrHJDg=";
      };
    };
  });
  meta = {
    description = "ament package for ACADO toolkit for MPC code generation";
  };
})
