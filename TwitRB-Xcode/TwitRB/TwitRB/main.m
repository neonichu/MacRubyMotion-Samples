//
//  main.m
//  TwitRB
//
//  Created by Boris Bügling on 27.10.12.
//
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
