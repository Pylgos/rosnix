{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-yaml,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_kernel";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_kernel";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_kernel" = substituteSource {
        src = fetchgit {
          name = "mola_kernel-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "5ed7b8ede7a1e279adebfbe178bbb52d27c62409";
          hash = "sha256-R3/091Ironh0K+U3ULYjK5RKbMNHcP/YkmPqDpZQyzw=";
        };
      };
    });
  };
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
})
